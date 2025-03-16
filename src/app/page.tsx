import * as React from 'react';
// import Image from 'next/image';
// MUI
import Button from '@mui/material/Button';
// custom components
import Navbar from './components/Navbar';

export default function Home() {
	return (
		<div>
			<Navbar />
			<Button variant='contained' color='primary'>
				Get News
			</Button>
			Test Test Test Test
			{/* <Image aria-hidden src='/file.svg' alt='File icon' width={16} height={16} /> */}
		</div>
	);
}
