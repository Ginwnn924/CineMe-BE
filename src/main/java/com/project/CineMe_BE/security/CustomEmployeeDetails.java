package com.project.CineMe_BE.security;

import com.project.CineMe_BE.entity.EmployeeEntity;
import com.project.CineMe_BE.entity.PermissionEntity;
import com.project.CineMe_BE.entity.RoleEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CustomEmployeeDetails implements UserDetails  {
    private EmployeeEntity employee;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<SimpleGrantedAuthority> listAuthorities = new ArrayList<>();
        List<PermissionEntity>  listPermission = employee.getRole().getListPermissions();
        listPermission.forEach(permission -> {
            listAuthorities.add(new SimpleGrantedAuthority(permission.getKey()));
        });
        return listAuthorities;
    }

    public UUID getId() {
        return employee.getId();
    }

    @Override
    public String getPassword() {
        return employee.getPassword();
    }

    @Override
    public String getUsername() {
        return employee.getEmail();
    }
}
