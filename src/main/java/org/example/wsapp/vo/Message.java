package org.example.wsapp.vo;

/**
 * Created by david on 21/04/2015.
 */
public class Message {
    
    private String who;
    private String message;
    private long date;

    public String getWho() {
        return who;
    }

    public void setWho(String who) {
        this.who = who;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public long getDate() {
        return date;
    }

    public void setDate(long date) {
        this.date = date;
    }
}
