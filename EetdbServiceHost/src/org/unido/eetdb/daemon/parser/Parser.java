package org.unido.eetdb.daemon.parser;

import java.io.File;
import java.util.List;

import org.unido.eetdb.common.model.Entity;

public interface Parser
{
    public List<Entity> parse(File file);
}