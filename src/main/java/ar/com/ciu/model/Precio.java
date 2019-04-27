package ar.com.ciu.model;

import java.util.Date;

public class Precio {

	private Integer id;
	private double monto;
	private Date fecha;
	private Integer id_producto;

	public Precio(double monto, Date date, Integer producto) {
		super();
		this.monto = monto;
		this.fecha = date;
		this.id_producto = producto;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Integer getId_producto() {
		return id_producto;
	}

	public void setId_precio(Integer id_producto) {
		this.id_producto = id_producto;
	}
}
