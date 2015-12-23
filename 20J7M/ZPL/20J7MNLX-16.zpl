set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.5312, <2> 20.6355, <3> 15.681, <4> 31.4431, <5> 32.0454, <6> 32.1769, <7> 31.8383, <8> 29.1136, <9> 24.81, <10> 22.1586, <11> 25.6326, <12> 23.3706, <13> 17.7047, <14> 24.4534, <15> 26.1008, <16> 18.8442, <17> 22.7227, <18> 27.5215, <19> 24.1185, <20> 22.742;
param workload[JOB] := <1> 3.941, <2> 4.5426, <3> 3.9599, <4> 5.6074, <5> 5.6609, <6> 5.6725, <7> 5.6425, <8> 5.3957, <9> 4.981, <10> 4.7073, <11> 5.0629, <12> 4.8343, <13> 4.2077, <14> 4.945, <15> 5.1089, <16> 4.341, <17> 4.7668, <18> 5.2461, <19> 4.9111, <20> 4.7689;
param capacity[MACHINE] := <1> 14.0434, <2> 14.0434, <3> 14.0434, <4> 14.0434, <5> 14.0434, <6> 14.0434, <7> 14.0434;

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
