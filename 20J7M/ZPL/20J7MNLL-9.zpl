set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1484, <2> 28.1235, <3> 24.2632, <4> 37.5359, <5> 27.0848, <6> 21.7576, <7> 24.8941, <8> 27.9809, <9> 27.8242, <10> 30.4775, <11> 30.0926, <12> 30.7552, <13> 26.8356, <14> 24.1414, <15> 27.5364, <16> 18.5043, <17> 24.9307, <18> 31.0957, <19> 22.8342, <20> 29.1596;
param workload[JOB] := <1> 19.1484, <2> 28.1235, <3> 24.2632, <4> 37.5359, <5> 27.0848, <6> 21.7576, <7> 24.8941, <8> 27.9809, <9> 27.8242, <10> 30.4775, <11> 30.0926, <12> 30.7552, <13> 26.8356, <14> 24.1414, <15> 27.5364, <16> 18.5043, <17> 24.9307, <18> 31.0957, <19> 22.8342, <20> 29.1596;
param capacity[MACHINE] := <1> 76.4251, <2> 76.4251, <3> 76.4251, <4> 76.4251, <5> 76.4251, <6> 76.4251, <7> 76.4251;

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
