package br.com.fiap.fiaprestaurant.shared.exception;


import java.time.LocalDateTime;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ResponseEntity handleException(Exception ex){

        MessageError messageError = new MessageError();
        messageError.setTimestamp(LocalDateTime.now());
        messageError.setStatus(HttpStatus.BAD_REQUEST.value());
        messageError.setMessage(ex.getMessage());

        return ResponseEntity.badRequest().body(messageError);
    }

}