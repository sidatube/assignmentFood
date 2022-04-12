package com.example.assignmentfood.model;

import com.example.assignmentfood.entity.Account;
import com.example.assignmentfood.ulti.Config.ConfigSql;
import com.example.assignmentfood.ulti.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class AccountModel {
    private UltraModel<Account> model;
    Connection connection;

    public AccountModel() {
        model = new UltraModel<>(Account.class);
    }

    public boolean save(Account account) {
        return model.save(account);
    }

    public Account findAccountByUsername(String username) {
        try {
            Connection connection = ConnectionHelper.createConnection();
            PreparedStatement preparedStatement =
                    connection.prepareStatement(
                            ConfigSql.SELECT_ACCOUNT_BY_USERNAME);
            preparedStatement.setString(1, username);
            // PrepareStatement
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String usernameDatabase = resultSet.getString("username");
                String passwordHash = resultSet.getString("passwordHash");
                String salt = resultSet.getString("salt");
                Account account = new Account();
                account.setUsername(usernameDatabase);
                account.setPasswordHash(passwordHash);
                account.setSalt(salt)
                ;
                account.setFullName(resultSet.getString("fullName"));
                account.setStatus(resultSet.getInt("status"));
                account.setFailureCount(resultSet.getInt("failureCount"));
                account.setCreatedAt(resultSet.getString("createdAt"));
                account.setRole(resultSet.getInt("role"));
                try {
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    if (resultSet.getString("lockTime") != null) {
                        account.setLockTime(LocalDateTime.parse(resultSet.getString("lockTime"), formatter));
                    }
                } catch (DateTimeParseException ex) {
                    System.out.println(ex.getMessage());
                }
                return account;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateLock(String username, Account account) {
        try {
            Connection connection = ConnectionHelper.createConnection();
            PreparedStatement statement =
                    connection.prepareStatement(
                            ConfigSql.LOCK_ACCOUNT);
            statement.setInt(1, account.getStatus());
            statement.setInt(2, account.getFailureCount());
            statement.setString(3, account.getLockTime().toString());
            statement.setString(4, username);
            statement.execute();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
}
