import React, { useState, useEffect } from 'react';
import { Card } from './card';
import { Error } from './error';

interface Digimon {
    nombre: string;
    imagen: string;
    nivel: string;
}

export const CardDigimon: React.FC = () => {
    const [digimons, setDigimons] = useState<Digimon[]>([]);
    const [cargando, setCargando] = useState<boolean>(true);
    const [error, setError] = useState<boolean>(false);

    useEffect(() => {
        const obtenerDigimons = async () => {
            setCargando(true);
            try {
                const response = await fetch('https://digimon-api.vercel.app/api/digimon');
                const data = await response.json();
                const seleccion: Digimon[] = [];
                for (let i = 0; i < 10; i++) {
                    const randomIdx = Math.floor(Math.random() * data.length);
                    const d = data[randomIdx];
                    seleccion.push({
                        nombre: d.name,
                        imagen: d.img,
                        nivel: d.level
                    });
                }

            setDigimons(seleccion);
                } catch (error) {
            console.error("Algo salió mal:", error);
                setError(true);
            } finally {
                setCargando(false);
            }
        };

        obtenerDigimons();
    }, []);

    if (cargando) return <h2 className="mensaje">Abriendo Digital World...</h2>;

    if (error) return <Error/>;

    return (
        <div className="grid-container">
            {digimons.map((d, index) => (
                <Card 
                    key={index} 
                    name={d.nombre} 
                    img={d.imagen} 
                    data={d.nivel} 
                    tag="Nivel" 
                />
            ))}
        </div>
    );
};