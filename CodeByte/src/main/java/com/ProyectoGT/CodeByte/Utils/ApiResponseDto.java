package com.ProyectoGT.CodeByte.Utils;

public class ApiResponseDto<T> {
    
    private Boolean status;
    private T data;
    private String message;
    
    /**
     * Default constructor for ApiResponseDto.
     */
    public ApiResponseDto() {
        
    }
    
    /**
     * Constructor for ApiResponseDto.
     * @param message the message included in the response
     * @param data the data object included in the response
     * @param status the status included in the response
     */
    public ApiResponseDto(String message, T data, Boolean status) {
        this.message = message;
        this.data = data;
        this.status = status;
    }

    /**
     * Returns the status included in the response.
     * @return the status included in the response
     */
    public Boolean getStatus() {
        return status;
    }

    /**
     * Sets the status included in the response.
     * @param status the status to set
     */
    public void setStatus(Boolean status) {
        this.status = status;
    }

    /**
     * Returns the data object included in the response.
     * @return the data object included in the response
     */
    public T getData() {
        return data;
    }

    /**
     * Sets the data object included in the response.
     * @param data the data to set
     */
    public void setData(T data) {
        this.data = data;
    }

    /**
     * Returns the message included in the response.
     * @return the message included in the response
     */
    public String getMessage() {
        return message;
    }

    /**
     * Sets the message included in the response.
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

}
