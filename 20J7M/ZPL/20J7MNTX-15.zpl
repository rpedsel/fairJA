set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.4087, <2> 23.6392, <3> 26.8131, <4> 18.9353, <5> 21.89, <6> 27.1524, <7> 14.3558, <8> 22.7371, <9> 33.1918, <10> 23.5879, <11> 23.7935, <12> 24.668, <13> 33.7955, <14> 22.5876, <15> 20.1044, <16> 17.9586, <17> 16.9128, <18> 24.1017, <19> 38.5516, <20> 33.3847;
param workload[JOB] := <1> 4.7338, <2> 4.862, <3> 5.1781, <4> 4.3515, <5> 4.6787, <6> 5.2108, <7> 3.7889, <8> 4.7683, <9> 5.7612, <10> 4.8567, <11> 4.8779, <12> 4.9667, <13> 5.8134, <14> 4.7526, <15> 4.4838, <16> 4.2378, <17> 4.1125, <18> 4.9093, <19> 6.209, <20> 5.7779;
param capacity[MACHINE] := <1> 10.5355, <2> 10.5355, <3> 10.5355, <4> 10.5355, <5> 10.5355, <6> 10.5355, <7> 10.5355;

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
