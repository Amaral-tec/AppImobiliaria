package domain;

import java.util.Objects;

import annotation.KeyType;
import annotation.Table;
import annotation.ColumnTable;

/*
 *
 * @author leandro.amaral
 */

@Table("TB_USERS")
public class User implements Persistent {

    public static Object consult;
    
    @ColumnTable(dbName = "id", setJavaName = "setId")
    private Long id;
    
    @ColumnTable(dbName = "name", setJavaName = "setName")
    private String name;

    @KeyType("getCpf")
    @ColumnTable(dbName = "cpf", setJavaName = "setCpf")
    private String cpf;
    
    @ColumnTable(dbName = "mobilePhone", setJavaName = "setMobilePhone")
    private Long mobilePhone;
    
    @ColumnTable(dbName = "email", setJavaName = "setEmail")
    private String email;
    
    @ColumnTable(dbName = "address", setJavaName = "setAddress")
    private String address;
    
    @ColumnTable(dbName = "number", setJavaName = "setNumber")
    private Integer number;
    
    @ColumnTable(dbName = "district", setJavaName = "setDistrict")
    private String district;
    
    @ColumnTable(dbName = "city", setJavaName = "setCity")
    private String city;
    
    @ColumnTable(dbName = "state", setJavaName = "setState")
    private String state;
    
    @ColumnTable(dbName = "cep", setJavaName = "setCep")
    private Long cep;
    
    @ColumnTable(dbName = "password", setJavaName = "setPassword")
    private String password;
    
    @ColumnTable(dbName = "level", setJavaName = "setLevel")
    private String level;
    
    @ColumnTable(dbName = "image", setJavaName = "setImage")
    private String image;

    public static Object getConsult() {
        return consult;
    }

    public static void setConsult(Object consult) {
        User.consult = consult;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Long getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(Long mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Long getCep() {
        return cep;
    }

    public void setCep(Long cep) {
        this.cep = cep;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
   
   
    
    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        User user = (User) o;
        return Objects.equals(cpf, user.cpf);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cpf);
    }

    @Override
    public String toString() {
        return "User{"
                + "name='" + name + '\''
                + ", cpf=" + cpf
                + ", mobilePhone=" + mobilePhone
                + ", email='" + email + '\''
                + '}';
    }
}
