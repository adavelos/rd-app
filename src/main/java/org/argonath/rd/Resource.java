package org.argonath.rd;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("/")
public class Resource {
    
    @Inject
    Service service;

    @GET
    @Path("/run")
    @Produces({"application/json"})
    public String run() {
        return "{TEST:test}";
    }
}
