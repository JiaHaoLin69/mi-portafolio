import react from 'react';
import '../../App.css'

interface Propcard {
    name: string;
    img: string;
    data: string | number;
    tag: string;
}

export const Card: react.FC<Propcard> = ({ name, img, data, tag }) => {
    return (
        <div className='card'>
            <img src={img} alt={name} className="card-img" />
            <h3>{name}</h3>
            {}
            <p>{tag}:{data}</p>
        </div>
    )

}