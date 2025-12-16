import React, { useState, useEffect } from 'react';
import { Card } from './card';
import { Error } from './error';


interface Pokemon {
    data: string;
    code: number;
    name: string;
    img: string;
    hp: number;
}

export const CardPokemon: React.FC<{ min: number; max: number }> = ({ min, max }) => {
    const [pokemons, setPokemons] = useState<Pokemon[]>([]);
    const [cargando, setCargando] = useState<boolean>(true);
    const [error, setError] = useState<boolean>(false);

    useEffect(() => {

        const obtenerPokemons = async () => {
            setCargando(true); 
            try {
                const request = [];
                for (let i = 0; i < 10; i++) {
                    const id = Math.floor(Math.random() * (max - min + 1)) + min;
                    request.push(fetch(`https://pokeapi.co/api/v2/pokemon/${id}`).then(res => res.json()));
                }

                const result = await Promise.all(request);

                const Cleardata = result.map((data: any) => ({
                    data: "", 
                    code: data.id,
                    name: data.name,
                    img: data.sprites.other['official-artwork'].front_default,
                    hp: data.stats[0].base_stat
                }));

            setPokemons(Cleardata); 
            } catch (error) {
                console.error("Algo salió mal:", error);
                setError(true);
            } finally {
                setCargando(false); 
            }
        };

        obtenerPokemons();
    }, [min, max]);

    if (cargando) return <h2 className="mensaje">Cargando...</h2>;

    if (error) return <Error/>;
    
    return (
        <div className="grid-container">
            {pokemons.map((p) => (
                <Card 
                    key={p.code}
                    name={p.name}
                    img={p.img}
                    data={p.hp.toString()}
                    tag='HP'
                />
            ))}
        </div>
    );
};
        