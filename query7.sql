SELECT moon.MoonID AS ID, moon.Diameter AS Diameter
FROM moon JOIN planet ON moon.Planet_PlanetID = planet.PlanetID
		  JOIN planetarysystem ON planetarysystem.PlanetarySystemID = planet.PlanetarySystem_PlanetarySystemID
WHERE planetarysystem.Name = "Solar System" AND (moon.Mass > 3.5 OR moon.OrbitalDays > 35000);