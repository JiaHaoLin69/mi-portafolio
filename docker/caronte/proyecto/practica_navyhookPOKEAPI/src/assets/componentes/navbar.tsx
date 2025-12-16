import React from 'react';
import { Nav } from 'react-bootstrap';
import { NavLink } from 'react-router-dom'; 

export const Navbar: React.FC = () => {
    return (
        <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <Nav className="me-auto">
                <Nav.Link as={NavLink} to="/">Inicio</Nav.Link>
                <Nav.Link as={NavLink} to="/generacion1">Generación 1</Nav.Link>
                <Nav.Link as={NavLink} to="/generacion2">Generación 2</Nav.Link>
                <Nav.Link as={NavLink} to="/generacion3">Generación 3</Nav.Link>
                <Nav.Link as={NavLink} to="/digimon">Digimon</Nav.Link>
            </Nav>
        </nav>
    );
};