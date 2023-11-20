package com.samsam.dto;

public class Fileboard {
    private int ano;
    private String title;
    private String content;
    private String regdate;
    private int visited;
    private String files;

    public Fileboard() {
    }

    public Fileboard(int ano, String title, String content, String regdate, int visited, String files) {
        this.ano = ano;
        this.title = title;
        this.content = content;
        this.regdate = regdate;
        this.visited = visited;
        this.files = files;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getVisited() {
        return visited;
    }

    public void setVisited(int visited) {
        this.visited = visited;
    }

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
    }
}
