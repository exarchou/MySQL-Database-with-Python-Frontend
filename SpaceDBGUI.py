# Libraries
from tkinter import *
import MySQLdb
from os import curdir, sep
try:
	from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer # for python 2
except:
	from http.server import BaseHTTPRequestHandler, HTTPServer # for python 3

import io
import base64

from PIL import Image, ImageTk
from urllib.request import Request, urlopen
from io import BytesIO


# Connection
database = MySQLdb.connect(host="localhost", user="root", passwd="8805", db="spacedb")
cur = database.cursor()

print(curdir)

class Window(object):
    def __init__(self,window):
        
        self.window = window
        self.window.wm_title("Space Database: To infinity and beyond!")

        self.list1 = Listbox(window, height=18, width=45)
        self.list1.place(x=20, y=50)
        self.list1.bind('<<ListboxSelect>>', self.get_selected_row)

        # now we need to attach a scrollbar to the listbox, and the other direction,too
        sb1 = Scrollbar(window)
        sb1.place(x=2, y=285)
        self.list1.config(yscrollcommand=sb1.set)
        sb1.config(command=self.list1.yview)

        # View data
        b1 = Button(window, text="View asteroids", width=18, command=self.view_asteroids)
        b1.place(x=300, y=50)

        b2 = Button(window, text="View black holes", width=18, command=self.view_blackholes)
        b2.place(x=300, y=80)
        
        b3 = Button(window, text="View civilizations", width=18, command=self.view_civilizations)
        b3.place(x=300, y=110)

        b4 = Button(window, text="View galaxies", width=18, command=self.view_galaxies)
        b4.place(x=300, y=140)

        b5 = Button(window, text="View moons", width=18, command=self.view_moons)
        b5.place(x=300, y=170)

        b6 = Button(window, text="View planets", width=18, command=self.view_planets)
        b6.place(x=300, y=200)

        b7 = Button(window, text="View planetary systems", width=18, command=self.view_planetarysystems)
        b7.place(x=300, y=230)

        b8 = Button(window, text="View satellites", width=18, command=self.view_satellites)
        b8.place(x=300, y=260)

        b9 = Button(window, text="View stars", width=18, command=self.view_stars)
        b9.place(x=300, y=290)

        b10 = Button(window, text="Close", width=18, command=window.destroy)
        b10.place(x=300, y=320)

        b21 = Button(window, text="Mass of Black Holes", width=28, command=self.view1).place(x=300, y=380)
        
        b22 = Button(window, text="Mass of Moons", width=28, command=self.view2).place(x=550, y=380)

        b23 = Button(window, text="Launch Sites of Satellites", width=28, command=self.view3).place(x=800, y=380)

        b24 = Button(window, text="Civilizations of Planets", width=28, command=self.view4).place(x=1050, y=380)




        # Insert data        
        b11 = Button(window, text="Add Asteroid", width=18, command=self.add_asteroid)
        b11.place(x=450, y=50)

        self.asteroid_id = StringVar()
        self.e1 = Entry(window, textvariable=self.asteroid_id)
        self.e1.place(x=600, y=50)

        self.asteroid_diameter = StringVar()
        self.e2 = Entry(window, textvariable=self.asteroid_diameter)
        self.e2.place(x=750, y=50)

        self.asteroid_type = StringVar()
        self.e3 = Entry(window, textvariable=self.asteroid_type)
        self.e3.place(x=900, y=50)

        self.asteroid_psid = StringVar()
        self.e4= Entry(window, textvariable=self.asteroid_psid)
        self.e4.place(x=1050, y=50)

        


        b12 = Button(window, text="Add Black Hole", width=18, command=self.add_blackhole)
        b12.place(x=450, y=80)

        self.blackhole_id = StringVar()
        self.e5 = Entry(window, textvariable=self.blackhole_id)
        self.e5.place(x=600, y=80)

        self.blackhole_name = StringVar()
        self.e6 = Entry(window, textvariable=self.blackhole_name)
        self.e6.place(x=750, y=80)

        self.blackhole_mass = StringVar()
        self.e7 = Entry(window, textvariable=self.blackhole_mass)
        self.e7.place(x=900, y=80)

        self.blackhole_type = StringVar()
        self.e8 = Entry(window, textvariable=self.blackhole_type)
        self.e8.place(x=1050, y=80)

        self.blackhole_gid = StringVar()
        self.e9 = Entry(window, textvariable=self.blackhole_gid)
        self.e9.place(x=1200, y=80)




        b13 = Button(window, text="Add Civilization", width=18, command=self.add_civilization)
        b13.place(x=450, y=110)

        self.civilization_id = StringVar()
        self.e10 = Entry(window, textvariable=self.civilization_id)
        self.e10.place(x=600, y=110)

        self.civilization_name = StringVar()
        self.e11 = Entry(window, textvariable=self.civilization_name)
        self.e11.place(x=750, y=110)

        self.civilization_type = StringVar()
        self.e12 = Entry(window, textvariable=self.civilization_type)
        self.e12.place(x=900, y=110)



        b14 = Button(window, text="Add Galaxy", width=18, command=self.add_galaxy)
        b14.place(x=450, y=140)

        self.galaxy_id = StringVar()
        self.e13 = Entry(window, textvariable=self.galaxy_id)
        self.e13.place(x=600, y=140)

        self.galaxy_name = StringVar()
        self.e14 = Entry(window, textvariable=self.galaxy_name)
        self.e14.place(x=750, y=140)

        self.galaxy_shape = StringVar()
        self.e15 = Entry(window, textvariable=self.galaxy_shape)
        self.e15.place(x=900, y=140)



        b15 = Button(window, text="Add Moon", width=18, command=self.add_moon)
        b15.place(x=450, y=170)

        self.moon_id = StringVar()
        self.e16 = Entry(window, textvariable=self.moon_id)
        self.e16.place(x=600, y=170)

        self.moon_mass = StringVar()
        self.e17 = Entry(window, textvariable=self.moon_mass)
        self.e17.place(x=750, y=170)

        self.moon_diameter = StringVar()
        self.e18 = Entry(window, textvariable=self.moon_diameter)
        self.e18.place(x=900, y=170)

        self.moon_days = StringVar()
        self.e19 = Entry(window, textvariable=self.moon_days)
        self.e19.place(x=1050, y=170)

        self.moon_pid = StringVar()
        self.e20 = Entry(window, textvariable=self.moon_pid)
        self.e20.place(x=1200, y=170)




        b16 = Button(window, text="Add Planet", width=18, command=self.add_planet)
        b16.place(x=450, y=200)

        self.planet_id = StringVar()
        self.e21 = Entry(window, textvariable=self.planet_id)
        self.e21.place(x=600, y=200)

        self.planet_name = StringVar()
        self.e22 = Entry(window, textvariable=self.planet_name)
        self.e22.place(x=750, y=200)

        self.planet_mass = StringVar()
        self.e23 = Entry(window, textvariable=self.planet_mass)
        self.e23.place(x=900, y=200)

        self.planet_period = StringVar()
        self.e24 = Entry(window, textvariable=self.planet_period)
        self.e24.place(x=1050, y=200)

        self.planet_dfs = StringVar()
        self.e25 = Entry(window, textvariable=self.planet_dfs)
        self.e25.place(x=1200, y=200)

        self.planet_psid = StringVar()
        self.e26 = Entry(window, textvariable=self.planet_psid)
        self.e26.place(x=1350, y=200)





        b17 = Button(window, text="Add Planetary System", width=18, command=self.add_planet)
        b17.place(x=450, y=230)

        self.planetarysystem_id = StringVar()
        self.e27 = Entry(window, textvariable=self.planetarysystem_id)
        self.e27.place(x=600, y=230)

        self.planetarysystem_name = StringVar()
        self.e28 = Entry(window, textvariable=self.planetarysystem_name)
        self.e28.place(x=750, y=230)

        self.planetarysystem_constellation = StringVar()
        self.e29 = Entry(window, textvariable=self.planetarysystem_constellation)
        self.e29.place(x=900, y=230)

        self.planetarysystem_mass = StringVar()
        self.e30 = Entry(window, textvariable=self.planetarysystem_mass)
        self.e30.place(x=1050, y=230)

        self.planetarysystem_mass_gid = StringVar()
        self.e31 = Entry(window, textvariable=self.planetarysystem_mass_gid)
        self.e31.place(x=1200, y=230)




        b18 = Button(window, text="Add Satellite", width=18, command=self.add_satellite)
        b18.place(x=450, y=260)

        self.satellite_id = StringVar()
        self.e32 = Entry(window, textvariable=self.satellite_id)
        self.e32.place(x=600, y=260)

        self.satellite_ls = StringVar()
        self.e33 = Entry(window, textvariable=self.satellite_ls)
        self.e33.place(x=750, y=260)

        self.satellite_cr = StringVar()
        self.e34 = Entry(window, textvariable=self.satellite_cr)
        self.e34.place(x=900, y=260)

        self.satellite_pid = StringVar()
        self.e35 = Entry(window, textvariable=self.satellite_pid)
        self.e35.place(x=1050, y=260)



        b19 = Button(window, text="Add Star", width=18, command=self.add_star)
        b19.place(x=450, y=290)

        self.star_id = StringVar()
        self.e36 = Entry(window, textvariable=self.star_id)
        self.e36.place(x=600, y=290)

        self.star_name = StringVar()
        self.e37 = Entry(window, textvariable=self.star_name)
        self.e37.place(x=750, y=290)

        self.star_mass = StringVar()
        self.e38 = Entry(window, textvariable=self.star_mass)
        self.e38.place(x=900, y=290)

        self.star_dfe = StringVar()
        self.e39 = Entry(window, textvariable=self.star_dfe)
        self.e39.place(x=1050, y=290)

        self.star_psid = StringVar()
        self.e40 = Entry(window, textvariable=self.star_psid)
        self.e40.place(x=1200, y=290)



        b20 = Button(window, text="Update", width=18, command=self.update_command)
        b20.place(x=450, y=320)



    def get_selected_row(self,event):   #the "event" parameter is needed b/c we've binded this function to the listbox
        try:
            index = self.list1.curselection()[0]
            self.selected_tuple = self.list1.get(index)
            self.e1.delete(0,END)
            self.e1.insert(END,self.selected_tuple[1])
            self.e2.delete(0, END)
            self.e2.insert(END,self.selected_tuple[2])
            self.e3.delete(0, END)
            self.e3.insert(END,self.selected_tuple[3])
            self.e4.delete(0, END)
            self.e4.insert(END,self.selected_tuple[4])
        except IndexError:
            pass                #in the case where the listbox is empty, the code will not execute

    def view_command(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        for row in database.view():
            self.list1.insert(END, row)




    def view_asteroids(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.asteroid;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view_blackholes(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.blackhole;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view_civilizations(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.civilization;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view_galaxies(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.galaxy;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view_moons(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.moon;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)



    def view_planets(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.planet;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view_planetarysystems(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.planetarysystem;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view_satellites(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.satellite;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)
            
    def view_stars(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.star;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view1(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.all_galaxies_black_holes_mass;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view2(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.all_moons_mass;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view3(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.all_planetary_systems_satellites_launch_sites;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)

    def view4(self):
        self.list1.delete(0, END)  # make sure we've cleared all entries in the listbox every time we press the View all button
        query = "SELECT * FROM spacedb.all_planets_civilizations;"
        cur.execute(query)    
        for row in cur.fetchall():
            self.list1.insert(END, row)





    def search_command(self):
        self.list1.delete(0, END)
        for row in database.search(self.asteroid_id.get(), self.asteroid_diameter.get(), self.year_text.get(), self.ISBN_text.get()):
            self.list1.insert(END, row)




    def add_asteroid(self):
        query = "INSERT INTO spacedb.asteroid VALUES (" + self.asteroid_id.get() + "," + self.asteroid_diameter.get() + ",'" + self.asteroid_type.get() + "'," + self.asteroid_psid.get() + ");"
        cur.execute(query) 

    def add_blackhole(self):
        query = "INSERT INTO spacedb.blackhole VALUES (" + self.blackhole_id.get() + ",'" + self.blackhole_name.get() + "'," + self.blackhole_mass.get() + ",'" + self.blackhole_type.get() + "'," + self.blackhole_gid.get() + ");"
        cur.execute(query) 

    def add_civilization(self):
        query = "INSERT INTO spacedb.civilization VALUES (" + self.civilization_id.get() + ",'" + self.civilization_name.get() + "','" + self.civilization_type.get() + "');"
        cur.execute(query) 
        
    def add_galaxy(self):
        query = "INSERT INTO spacedb.galaxy VALUES (" + self.galaxy_id.get() + ",'" + self.galaxy_name.get() + "','" + self.galaxy_shape.get() + "');"
        cur.execute(query) 

    def add_galaxy(self):
        query = "INSERT INTO spacedb.galaxy VALUES (" + self.galaxy_id.get() + ",'" + self.galaxy_name.get() + "','" + self.galaxy_shape.get() + "');"
        cur.execute(query)

    def add_moon(self):
        query = "INSERT INTO spacedb.moon VALUES (" + self.moon_id.get() + "," + self.moon_mass.get() + "," + self.moon_diameter.get() + "," + self.moon_days.get() + "," + self.moon_pid.get() + ");"
        cur.execute(query)

    def add_planet(self):
        query = "INSERT INTO spacedb.planet VALUES (" + self.planet_id.get() + ",'" + self.planet_name.get() + "'," + self.planet_mass.get() + "," + self.planet_period.get() + "," + self.planet_dfs.get() + "," + self.planet_psid + ");"
        cur.execute(query)

    def add_planetarysystem(self):
        query = "INSERT INTO spacedb.planetarysystem VALUES (" + self.planetarysystem_id.get() + ",'" + self.planetarysystem_name.get() + "','" + self.planetarysystem_constellation.get() + "'," + self.planetarysystem_mass.get() + "," + self.planetarysystem_mass_gid.get() + ");"
        cur.execute(query)

    def add_satellite(self):
        query = "INSERT INTO spacedb.satellite VALUES (" + self.satellite_id.get() + ",'" + self.satellite_ls.get() + "','" + self.satellite_cr.get() + "'," + self.satellite_pid.get() + ");"
        cur.execute(query)

    def add_star(self):
        query = "INSERT INTO spacedb.star VALUES (" + self.star_id.get() + ",'" + self.star_name.get() + "'," + self.star_mass.get() + "," + self.star_dfe.get() + "," + self.star_psid.get() + ");"
        cur.execute(query)



    def delete_command(self):
        database.delete(self.selected_tuple[0])
        self.view_command()

    def update_command(self):
        try:
            # Commit your changes in the database
            database.commit()
        except:
            # Rollback in case there is any error
            database.rollback()





# code for the GUI (front end)
window = Tk()
window.geometry("1500x860")

URL = "https://cdn.nextgov.com/media/img/upload/2020/10/19/NGspace20201019/860x394.jpg"
u = urlopen(URL)
raw_data = u.read()
u.close()

im = Image.open(BytesIO(raw_data))
photo = ImageTk.PhotoImage(im)

label = Label(image=photo)
label.image = photo
label.pack()
label.place(x=310, y=450)

Window(window)

window.mainloop()





