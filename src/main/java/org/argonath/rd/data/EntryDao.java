package org.argonath.rd.data;

import org.argonath.rd.model.Entry;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

public class EntryDao {

    @Inject
    private EntityManager em;

    public void createEntry(Entry entry) {
        EntryJpo entryJpo = new EntryJpo(entry);
        em.persist(entryJpo);
    }

    public Entry get(String entity, String key) {
        try {
            EntryJpo entryJpo = em.createQuery("select e from Entry e where e.entity = :entity and e.key = :key", EntryJpo.class)
                    .setParameter("entity", entity)
                    .setParameter("key", key)
                    .getSingleResult();
            return entryJpo.model();
        } catch (NonUniqueResultException e) {
            throw new RuntimeException("Multiple Results where Single Result expected");
        } catch (NoResultException e) {
            return null;
        }
    }
}
