import React, { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import './App.css';
import { Navbar } from './assets/componentes/navbar';
import { CardDigimon } from './assets/componentes/digimon';
import { CardPokemon } from './assets/componentes/pokemon';
import { Error } from './assets/componentes/error';
import { Card } from './assets/componentes/card';
import { Header } from './assets/componentes/header';

interface Pokemon {
    id: number;
    nombre: string;
    imagen: string;
    hp: number;
}

const Inicio: React.FC = () => {
    const [pokemon, setPokemon] = useState<Pokemon | null>(null);
    const [cargando, setCargando] = useState<boolean>(true);
    const [error, setError] = useState<boolean>(false);

    useEffect(() => {

        const GetPokemon = async () => {
            setCargando(true); 
            try {
                const id = Math.floor(Math.random() * 386) + 1;
                const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`);
                const data = await response.json();
                const datosLimpios: Pokemon = {
                    id: data.id,
                    nombre: data.name,
                    imagen: data.sprites.other['official-artwork'].front_default,
                    hp: data.stats[0].base_stat
                };

            setPokemon(datosLimpios); 
            } catch (error) {
                console.error("Algo salió mal:", error);
                setError(true);
            } finally {
                setCargando(false); 
            }
        };

        GetPokemon();
    }, []);


    if (cargando) return <div className="mensaje"><h2>Cargando Pokémon sorpresa...</h2></div>;


    if (error) return <div className="mensaje"><Error/></div>;

    return (
        <div className="mensaje">
            <h1 className='titulo-app'>Bienvenido a la Pokédex</h1>
            <p>Aquí tienes un Pokémon aleatorio de las primeras 3 generaciones:</p>
            {}
            <div style={{ display: 'flex', justifyContent: 'center', marginTop: '20px' }}>
                {pokemon && (
                    <Card 
                      name={pokemon.nombre}
                      img={pokemon.imagen}
                      data={pokemon.hp.toString()} tag={''}                   
                    />
                )}
            </div>
        </div>
    );
};

const App: React.FC = () => {
    return (
        <BrowserRouter>
        {}
            <Header />
            <Navbar />
            <main className="main-content">
                <Routes>
                    <Route path="/" element={<Inicio />} />
                    <Route path="/generacion1" element={<CardPokemon min={1} max={151} />} />
                    <Route path="/generacion2" element={<CardPokemon min={152} max={251} />} />
                    <Route path="/generacion3" element={<CardPokemon min={252} max={386} />} />
                    <Route path="/digimon" element={<CardDigimon />} />
                    <Route path="*" element={<div className="mensaje"><Error/></div>} />
                </Routes>
            </main>
        </BrowserRouter>
    );
}

export default App;