set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.186, <2> 32.073, <3> 33.2554, <4> 19.8881, <5> 29.4679, <6> 38.2839, <7> 40.6368, <8> 13.0029, <9> 18.7979, <10> 29.8572;
param workload[JOB] := <1> 261.9866, <2> 1028.6773, <3> 1105.9216, <4> 395.5365, <5> 868.3571, <6> 1465.657, <7> 1651.3495, <8> 169.0754, <9> 353.361, <10> 891.4524;
param capacity[MACHINE] := <1> 2047.8436, <2> 2047.8436, <3> 2047.8436;

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
