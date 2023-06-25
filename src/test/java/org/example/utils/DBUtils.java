package org.example.utils;

import org.example.config.ConfigFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.util.List;
import java.util.Map;

public class DBUtils {
    
    private final JdbcTemplate jdbcTemplate;
    
    public DBUtils ()
    {
        String url= ConfigFactory.getConfigProperties().URL();
        String username=ConfigFactory.getConfigProperties().USERNAME();
        String password=ConfigFactory.getConfigProperties().PASSWORD();
        String driverClassName=ConfigFactory.getConfigProperties().DRIVER_CLASS_NAME();
    
        System.out.println("URL:: "+url);
        System.out.println("username:: "+username);
        System.out.println("PASSWORD:: "+password);
        System.out.println("DRIVER_CLASS_NAME:: "+driverClassName);
    
        DriverManagerDataSource driverManagerDataSource=new DriverManagerDataSource();
        
        driverManagerDataSource.setUrl(url);
        driverManagerDataSource.setUsername(username);
        driverManagerDataSource.setPassword(password);
        driverManagerDataSource.setDriverClassName(driverClassName);
        
        jdbcTemplate=new JdbcTemplate(driverManagerDataSource);
        
    }
    
    public Object readValue(String query)
    {
        return jdbcTemplate.queryForObject(query, Object.class);
    }
    
    /** METHODS TO RETURN SINGLE ROW **/
    public Map<String, Object> readRow(String query)
    {
        return jdbcTemplate.queryForMap(query);
    }
    
    /** METHODS TO RETURN MULTIPLE ROW **/
    public List<Map<String, Object>> readRows(String query)
    {
        return jdbcTemplate.queryForList(query);
    }
    
    /** INSERT QUERY TO INSERT DATA INTO DATABASE **/
    public void insertProduct( String product_title, String product_name, String product_desc,Boolean is_available,double product_price, int product_quantity, Long category_id)
    {
        String query = "INSERT INTO products ( product_title, product_name, product_desc, is_available, product_price, product_quantity, category_id) VALUES (?,?,?,?,?,?,?)";
        
        jdbcTemplate.update(query, product_title, product_name,product_desc,is_available,product_price,product_quantity,category_id);
    }
}
