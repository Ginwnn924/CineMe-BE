package com.project.CineMe_BE.dto.response;

import lombok.*;

import java.util.List;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoleResponse {
    private String name ;
    private List<PermissionResponse> permissionList;
}
