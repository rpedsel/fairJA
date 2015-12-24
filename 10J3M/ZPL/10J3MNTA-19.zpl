set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.8241, <2> 31.3265, <3> 19.222, <4> 28.2558, <5> 35.0044, <6> 22.605, <7> 24.6035, <8> 28.1544, <9> 28.1305, <10> 25.1373;
param workload[JOB] := <1> 1077.4215, <2> 981.3496, <3> 369.4853, <4> 798.3902, <5> 1225.308, <6> 510.986, <7> 605.3322, <8> 792.6702, <9> 791.325, <10> 631.8839;
param capacity[MACHINE] := <1> 1946.038, <2> 1946.038, <3> 1946.038;

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
