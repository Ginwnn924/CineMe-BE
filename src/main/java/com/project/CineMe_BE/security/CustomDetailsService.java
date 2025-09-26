package com.project.CineMe_BE.security;

import com.project.CineMe_BE.entity.EmployeeEntity;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.repository.EmployeeRepository;
import com.project.CineMe_BE.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CustomDetailsService implements UserDetailsService  {
    private final EmployeeRepository employeeRepository;
    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // check employee first
        Optional<EmployeeEntity> emp = employeeRepository.findByEmail(username);
        if(emp.isPresent()) {
            EmployeeEntity entity = emp.get();
            return new CustomEmployeeDetails(entity, entity.getRole().getListPermissions());
        }

        // check user
        UserEntity user = userRepository.findByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
        return new CustomUserDetails(user);
    }
}
