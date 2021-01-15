SELECT moon.moonid AS ID, moon.OrbitalDays
FROM moon JOIN planet ON moon.Planet_PlanetID = Planet.PlanetID
WHERE planet.name = 'Saturn' AND moon.Mass < 10;