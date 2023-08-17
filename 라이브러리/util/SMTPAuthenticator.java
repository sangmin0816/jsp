package com.chunjae.util;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
  Path path = Paths.get("d:\\email.txt");
  List<String> str = Files.readAllLines(path);
  String id = str.get(0);
  String pw = str.get(1);

  public SMTPAuthenticator() throws IOException {
  }

  @Override
  protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(id, pw);
  }

}
