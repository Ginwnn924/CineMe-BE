package com.project.CineMe_BE.repository.projection;

import java.util.UUID;

public interface UserListProjection {
    UUID getId();

    String getFullName();

    String getEmail();

    String getPhone();

    String getProvider();

    String getCreatedAt();

    String getUpdatedAt();

    Boolean getLocked();
}
