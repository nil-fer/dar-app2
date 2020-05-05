import React from "react"
import scrollToElement from 'scroll-to-element'

export default function OutletMenu({categories}) {
  React.useEffect(() => {
    console.log('yo', categories)
  }, [])
  return (<>{categories.map((category, i) => {
    return <MenuItem value={category} id={'category_' + i}  />
  })}</>)
}

function MenuItem({value, id}){
  return (
    <h4 onClick={() => {
    const element = document.getElementById(id);
    scrollToElement(element, {
      offset: 0,
      duration: 1000
    })
  }} className='menu_item'>{value}</h4>)
}
