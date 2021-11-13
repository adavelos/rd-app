package org.argonath.rd.data;

import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class EmProducer {

    @PersistenceContext
    @Produces
    private EntityManager em;
}
