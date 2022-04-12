package com.example.assignmentfood.entity;

import com.example.assignmentfood.annotation.Column;
import com.example.assignmentfood.annotation.Id;
import com.example.assignmentfood.annotation.Table;

import java.time.LocalDateTime;

@Table(name = "accounts")
public class Account {
    @Id
    @Column(name = "username", type = "VARCHAR(50)")
    private String username;
    @Column(name = "fullName", type = "VARCHAR(255)")
    private String fullName;
    @Column(name = "passwordHash", type = "VARCHAR(255)")
    private String passwordHash;
    @Column(name = "salt", type = "VARCHAR(255)")
    private String salt;
    @Column(name = "createdAt", type = "VARCHAR(255)")
    private String createdAt;
    @Column(name = "failureCount", type = "INT")
    private int failureCount;
    @Column(name = "lockTime", type = "DATETIME")
    private LocalDateTime lockTime;
    @Column(name = "status", type = "INT")
    private int status;
    @Column(name = "role", type = "INT DEFAULT 1")
    private int role;

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Account() {
        this.status = 1;
        this.role = 1;
    }

    public Account(String username, String fullName, String passwordHash, String salt, String createdAt, int failureCount, LocalDateTime lockTime) {
        this.username = username;
        this.fullName = fullName;
        this.passwordHash = passwordHash;
        this.salt = salt;
        this.createdAt = createdAt;
        this.failureCount = failureCount;
        this.lockTime = lockTime;
        this.status = 1;
    }

    @Override
    public String toString() {
        return "Account{" +
                "username='" + username + '\'' +
                ", fullName='" + fullName + '\'' +
                ", passwordHash='" + passwordHash + '\'' +
                ", salt='" + salt + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", failureCount=" + failureCount +
                ", lockTime=" + lockTime +
                ", status=" + status +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public int getFailureCount() {
        return failureCount;
    }

    public void setFailureCount(int failureCount) {
        this.failureCount = failureCount;
    }

    public LocalDateTime getLockTime() {
        return lockTime;
    }

    public void setLockTime(LocalDateTime lockTime) {
        this.lockTime = lockTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
