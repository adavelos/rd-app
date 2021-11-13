package org.argonath.rd.rest;

import org.argonath.rd.data.EntryDao;
import org.argonath.rd.model.Entry;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.*;

@Stateless
@Path("/entry")
public class EntryResource {

    @Inject
    private EntryDao entryDao;

    @GET
    @Path("/{entity}/{key}")
    @Produces({"application/json"})
    public Entry getEntry(@PathParam("entity") String entity, @PathParam("key") String key) {
        return entryDao.get(entity, key);
    }

    @GET
    @Path("/{entity}")
    @Produces({"application/json"})
    public String listEntries(@PathParam("entity") String entity) {
        throw new UnsupportedOperationException("not supported");
    }

    @POST
    @Path("/{entity}/{key}")
    @Consumes({"application/json"})
    public void createEntry(@PathParam("entity") String entity, @PathParam("key") String key, String data) {
        Entry entry = new Entry(key, entity, "DESC", "ATTR");
        entryDao.createEntry(entry);
    }

    @PUT
    @Path("/{entity}/{key}")
    @Consumes({"application/json"})
    public void updateEntry(@PathParam("entity") String entity, @PathParam("key") String key, String data) {
        throw new UnsupportedOperationException("not supported");
    }
}
