package com.kalix.tools.sshd;

import com.jcraft.jsch.JSchException;

import java.io.IOException;
import java.util.List;

public interface IShellUtils {
    void sendCommand(List<String> commandList) throws JSchException, IOException;
    void sendCommand(SshConfiguration conf,List<String> commandList) throws JSchException, IOException;
}
