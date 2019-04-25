package ar.com.ciu.model;

public class Cliente {

	// atributos
	private Integer id;
	private String codigo;
	private String apellido;
	private String nombre;

	// constructor
	public Cliente(String codigo, String apellido, String nombre) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.codigo = codigo;
	}

	// gets y sets
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

}
