set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.0766, <2> 31.9013, <3> 28.1405, <4> 20.7035, <5> 17.1463, <6> 18.4438, <7> 30.0323, <8> 24.7951, <9> 30.8081, <10> 24.5803, <11> 30.7428, <12> 25.665, <13> 28.28, <14> 30.9334, <15> 23.7797, <16> 38.5397, <17> 23.3198, <18> 31.5949, <19> 23.7068, <20> 32.1432;
param workload[JOB] := <1> 5.2987, <2> 5.6481, <3> 5.3048, <4> 4.5501, <5> 4.1408, <6> 4.2946, <7> 5.4802, <8> 4.9795, <9> 5.5505, <10> 4.9579, <11> 5.5446, <12> 5.0661, <13> 5.3179, <14> 5.5618, <15> 4.8764, <16> 6.208, <17> 4.8291, <18> 5.6209, <19> 4.869, <20> 5.6695;
param capacity[MACHINE] := <1> 12.9711, <2> 12.9711, <3> 12.9711, <4> 12.9711, <5> 12.9711, <6> 12.9711;

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
