# tech\_radar

This is a Rails engine for managing a [Tech Radar]() for your team.  It allows you to identify the technology in use on your team, where
it is in your level of adoption and other bits of metadata, such as whitepapers, blog posts, etc.

The Tech Radar is a way you can manage the use of technology on your team.  This tool makes it easier to do that, but you'll still need
process and good communication to make the most of it.

# Install and Setup

TBD

# Managing the Radar

This engine doesn't require a database.  Instead, the radar is managed in a YAML file, `config/radar.yml`.  The reason is that your radar
should not change frequently, and it should change via a controlled process, on a regular schedule.  In other words, it's not designed to
be a frequently-changing resource you want to CRUD.


