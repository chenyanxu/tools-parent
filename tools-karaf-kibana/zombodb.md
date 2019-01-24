##zombodb实现es中文分词
1. 安装中文分词：
进入[https://github.com/medcl/elasticsearch-analysis-ik/releases]()，选择和本机下elasticsearch相匹配的版本，将下载好的安装包解压到`elasticsearch\plugins\ik`目录下。
```
cd /usr/share/elasticsearch/bin
./elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik \
/releases/download/v6.5.3/elasticsearch-analysis-ik-6.5.3.zip
```

2. 安装zombodb：  
前提安装好postgre10；  
进入`https://www.zombodb.com/releases`；  
选择数据库版本为postgre10Linux为centos7，查询版本，选择需要安装的版本，在扩展位置右键复制链接；  
在Linux下运行：`rpm -ivh https://www.zombodb.com/releases/v10-1.0.0/zombodb_centos7_pg10-10-1.0.0_1.x86_64.rpm`；  
可参照下载教程：[https://github.com/zombodb/zombodb]()；

3. 利用zombodb创建数据库中表的索引：  
在数据库中创建ZomboDB扩展：  
`CREATE EXTENSION zombodb;`  
创建对应函数，指定为中文分词和分词类型：  
`SELECT zdb.define_analyzer('myik', '{"tokenizer": "ik_max_word"}');`  
将函数指定为表的数据类型：  
`CREATE DOMAIN myik AS text;`  
创建表：  
`CREATE TABLE test (id int4,name text,content myik);`  
添加测试数据：  
`INSERT INTO test (content) VALUES ('中国驻洛杉矶领事馆遭亚裔男子枪击 嫌犯已自首');`  
`INSERT INTO test (content) VALUES ('中韩渔警冲突调查：韩警平均每天扣1艘中国渔船');`  
最后创建索引并制定url：  
`CREATE INDEX idxmyik ON test USING zombodb ((test.*)) WITH (url='localhost(可以是其他ip):9200/');
CREATE INDEX idxmyik ON test USING zombodb ((test.*)) WITH (url='http://106.12.199.69:9200/');
`  
当存在多个字段而我们只需要其中一个或几个的时候可以创建特定列索引：  
首先定义一个复合数据类型  
`CREATE TYPE products_idx_type AS (id int4,name text);`  
创建索引：  
`CREATE INDEX idxproducts ON products USING zombodb ((ROW(id,name)::products_idx_type)) WITH (url='localhost:9200/')`  

4.测试  
在数据库中：  
`SELECT * FROM test WHERE test ==> 'content:中国';`  
在es中:  
查找词：中国

    "query" : {
		"match" : {
			"content" : "中国" }},
	    "highlight" : {
	        "pre_tags" : ["<tag1>"],
	        "post_tags" : ["</tag1>"],
	        "fields" : {
	            "content" : {}
	        }
		}
	}
返回结果如下：

	    "took": 14,
	    "timed_out": false,
	    "_shards": {
	        "total": 5,
	        "successful": 5,
	        "failed": 0
	    },
	    "hits": {
	        "total": 2,
	        "max_score": 2,
	        "hits": [
	            {
	                "_index": "index",
	                "_type": "fulltext",
	                "_id": "4",
	                "_score": 2,
	                "_source": {
	                    "content": "中国驻洛杉矶领事馆遭亚裔男子枪击 嫌犯已自首"
	                },
	                "highlight": {
	                    "content": [
	                        "<tag1>中国</tag1>驻洛杉矶领事馆遭亚裔男子枪击 嫌犯已自首 "
	                    ]
	                }
	            },
	            {
	                "_index": "index",
	                "_type": "fulltext",
	                "_id": "3",
	                "_score": 2,
	                "_source": {
	                    "content": "中韩渔警冲突调查：韩警平均每天扣1艘中国渔船"
	                },
	                "highlight": {
	                    "content": [
	                        "中韩渔警冲突调查：韩警平均每天扣1艘<tag1>中国</tag1>渔船"
	                    ]
	                }
	            }
	        ]
	    }

	分词完成