SELECT blackhole.Name AS Name, MIN(blackhole.Mass) AS Mass
FROM blackhole JOIN galaxy ON blackhole.Galaxy_GalaxyID = galaxy.GalaxyID
WHERE galaxy.name = "Milky Way";