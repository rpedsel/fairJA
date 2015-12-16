set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8353, <2> 23.0528, <3> 24.3478, <4> 28.9638, <5> 25.9839, <6> 26.3281, <7> 19.5155, <8> 20.3914, <9> 17.2476, <10> 25.5188;
param workload[JOB] := <1> 831.4745, <2> 531.4316, <3> 592.8154, <4> 838.9017, <5> 675.1631, <6> 693.1688, <7> 380.8547, <8> 415.8092, <9> 297.4797, <10> 651.2092;
param capacity[MACHINE] := <1> 5908.3079, <2> 5908.3079, <3> 5908.3079;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
