package ru.reksoft.demo.service.generic;

public class ResourceCannotUpdateException extends Exception {

    public ResourceCannotUpdateException(String message) {
        super(message);
    }

    public ResourceCannotUpdateException(String message, Throwable cause) {
        super(message, cause);
    }
}
