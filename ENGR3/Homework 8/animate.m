function animate(t,theta)

% This function takes as input a vector t and a vector theta, and
% uses them to generate the corresponding animation for a pendulum

shg;
clf;


for k=1:length(t)
    subplot(2,1,1)
    hold off
    plot(sin(theta(k)),-cos(theta(k)),'.','MarkerSize',30)
    hold on
    plot([0 sin(theta(k))],[0 -cos(theta(k))]);
    plot([0],[0],'r.','MarkerSize',10)
    axis([-1.5 1.5 -1.5 1.5])
    axis square
    xlabel('x')
    ylabel('y')
    subplot(2,1,2)
    plot(t(1:k),theta(1:k));
    axis([0 t(end) -1.2*abs(min(theta)) 1.2*abs(max(theta))])
    xlabel('t')
    ylabel('theta')
    if k==1
       pause(0.1)
    else
       pause(0.03)
    end
end

pause(1)

end