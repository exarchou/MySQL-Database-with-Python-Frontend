SELECT satellite.CarrierRocket
FROM satellite JOIN planet ON satellite.Planet_PlanetID = planet.PlanetID
WHERE planet.Name = "Mars";
