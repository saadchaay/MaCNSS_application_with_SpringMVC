package com.macnss.repositories;

import com.macnss.entities.Dossier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DossierRepository extends JpaRepository<Dossier, Long> {

    @Modifying
    @Query("update Dossier d set d.status = :status where d.id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);

}
