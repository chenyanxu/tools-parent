# 异常处理
## 异常基类
> 所有的kalix的异常均为 RuntimeException
```java
public class KalixRuntimeException extends RuntimeException {
    private String content; //系统返回的错误描述

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 构造函数
     *
     * @param content
     * @param message
     */
    public KalixRuntimeException(String content, String message) {
        super(message);
        this.content = content;
    }

    /**
     * 不允许构造无参数的类
     */
    private KalixRuntimeException() {

    }
}
```

## 自定义的异常类
```java
/**
 * Created by sunlf on 2016-09-01.
 * 任务处理失败异常类
 */
public class TaskProcessException extends KalixRuntimeException {
    private static final String content = "任务处理失败！";

    public TaskProcessException(String exceptionMsg) {
        super(content, exceptionMsg);
    }
}
```

## 异常处理

```java
    @Override
    @Transactional
    public JsonStatus completeTask(String taskId, String accepted, String comment) {
        JsonStatus jsonStatus = new JsonStatus();

        try {
            XXXXXX
            jsonStatus.setMsg("任务处理成功！");
        } catch (Exception e) {
            e.printStackTrace();
            throw new TaskProcessException(e.getMessage());
        }
        return jsonStatus;
    }
```

## 自定义异常抛出
> 异常message体给空值。
```java
    if (!bean.getCreateBy().equals(this.getShiroService().getCurrentUserRealName()))
                throw new NotSameStarterException("");
```