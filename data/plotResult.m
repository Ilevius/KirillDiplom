clc;
close all;



% 1)real(u), 2)imag(u), 3)real(v), 4)imag(v), 5)real(w), 6)imag(w)
fieldNum = 6;
polar_couple = [6 6];

data = load("u_comsol.txt");
data = data(1:4:end, :);
x_comsol = data(:,1)/6.32;
u_comsol = data(:,fieldNum+3)*1e3;
%  1)x, 2)y, 3)z, 4)real(u), 5)imag(u), 6)real(v), 7)imag(v), 8)real(w), 9)imag(w)

data = load("u_integral.txt");
x_forftran = data(1:3:end,1)/6.32;
alf_fortran = pi/2 - data(:,6);
u_forftran = data(1:3:end,fieldNum+6);
u_forftran_p = sqrt(data(:,polar_couple(1)+6).^2 + data(:,polar_couple(2)+6).^2);
%  1)x, 2)y, 3)z, 4)R, 5)phi, 6)psi, 7)real(u), 8)imag(u), 9)real(v), 10)imag(v), 11)real(w), 12)imag(w)

data = load("u_residue.txt");
x_res = data(:,1)/6.32;
alf_res = pi/2 - data(:,6);
u_res = data(:,fieldNum+6);
% u_res = u_res./u_forftran;
% u_res_p = sqrt(data(:,polar_couple(1)+6).^2 + data(:,polar_couple(2)+6).^2);
%  1)x, 2)y, 3)z, 4)R, 5)phi, 6)psi, 7)real(u), 8)imag(u), 9)real(v), 10)imag(v), 11)real(w), 12)imag(w)

data = load("u_Sphase.txt");
alf_Sphase =  pi/2 - data(:,6); 
u_Sphase = sqrt(data(:,polar_couple(1)+6).^2 + data(:,polar_couple(2)+6).^2);
%  1)x, 2)y, 3)z, 4)R, 5)phi, 6)psi, 7)real(u), 8)imag(u), 9)real(v), 10)imag(v), 11)real(w), 12)imag(w)




widthmm = 70;
hightmm = 50;
textpt = 8;
multiple = 1;
widpi = (650/127)*widthmm*multiple;
higpi = (480/127)*hightmm*multiple;
textri = textpt*multiple;
set(0, 'DefaultAxesFontSize', textri, 'DefaultAxesFontName', 'Times New Roman');
set(0, 'DefaultTextFontSize', textri, 'DefaultTextFontName', 'Times New Roman');

fh = figure();
set (fh, 'Position', [200 200 widpi higpi]);


plot(x_comsol, u_comsol, x_forftran, u_forftran, 'x', x_res, u_res, '--', 'markerSize', 7, 'lineWidth', 1);
% xlim([-15 15]); ylim([0, 0.03]);
legend('COMSOL', 'интеграл', 'вычет')


xlabel('$x$, mm', 'Interpreter', 'LaTeX');
ylabel('$|u|$, mm', 'Interpreter', 'LaTeX');
grid on

f_pol = figure();
polarplot(alf_fortran, u_forftran_p, alf_Sphase, u_Sphase, 'x');
legend('интеграл','стац. фаза')
thetalim([180 360]);
% rlim([0 3e-5])
% plot(data(:,1), data(:,3))
