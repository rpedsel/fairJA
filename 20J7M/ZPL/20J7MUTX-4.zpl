set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.9086, <2> 40.1721, <3> 45.3449, <4> 9.2461, <5> 3.5186, <6> 14.2487, <7> 46.3678, <8> 41.5317, <9> 21.8648, <10> 25.8678, <11> 23.26, <12> 43.9517, <13> 13.1538, <14> 23.9218, <15> 21.4605, <16> 31.1301, <17> 2.3007, <18> 12.4559, <19> 47.1768, <20> 2.9135;
param workload[JOB] := <1> 4.7863, <2> 6.3381, <3> 6.7339, <4> 3.0407, <5> 1.8758, <6> 3.7747, <7> 6.8094, <8> 6.4445, <9> 4.676, <10> 5.086, <11> 4.8229, <12> 6.6296, <13> 3.6268, <14> 4.891, <15> 4.6325, <16> 5.5794, <17> 1.5168, <18> 3.5293, <19> 6.8685, <20> 1.7069;
param capacity[MACHINE] := <1> 10.0038, <2> 10.0038, <3> 10.0038, <4> 10.0038, <5> 10.0038, <6> 10.0038, <7> 10.0038;

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
