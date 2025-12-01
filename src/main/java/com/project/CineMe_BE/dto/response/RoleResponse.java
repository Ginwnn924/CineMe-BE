package com.project.CineMe_BE.dto.response;

import lombok.*;

import java.util.List;
import java.util.UUID;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoleResponse {
    private UUID id;
    private String name ;
    private List<PermissionResponse> permissionList;
}
