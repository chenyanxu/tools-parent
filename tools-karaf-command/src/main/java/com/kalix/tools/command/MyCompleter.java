package com.kalix.tools.command;

/**
 * Created by sunlf on 2015/12/4.
 */

import org.apache.karaf.shell.api.action.lifecycle.Service;
import org.apache.karaf.shell.api.console.CommandLine;
import org.apache.karaf.shell.api.console.Completer;
import org.apache.karaf.shell.api.console.Session;
import org.apache.karaf.shell.support.completers.StringsCompleter;

import java.util.List;

/**
 * <p>
 * My completer.
 * </p>
 */

@Service
public class MyCompleter implements Completer {

    public int complete(Session session, CommandLine commandLine, List<String> candidates) {

        StringsCompleter delegate = new StringsCompleter();
        delegate.getStrings().add("init-db");
        delegate.getStrings().add("run");
        delegate.getStrings().add("list");
        return delegate.complete(session, commandLine, candidates);
    }
}

