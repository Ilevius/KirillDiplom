data_int = load("u_integral.txt");
data_comsol = load("comsol arc.txt");
plot(data_int(:,3), data_int(:,12), data_comsol(:,3), -data_comsol(:,7)*1000, 'x')