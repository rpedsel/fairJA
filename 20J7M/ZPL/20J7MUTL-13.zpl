set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.8284, <2> 46.8506, <3> 8.7502, <4> 1.4414, <5> 37.3835, <6> 1.4635, <7> 17.9523, <8> 21.0006, <9> 30.5872, <10> 42.2015, <11> 44.6368, <12> 30.2117, <13> 27.7219, <14> 16.2722, <15> 23.4152, <16> 5.4436, <17> 32.5461, <18> 47.3737, <19> 8.3838, <20> 38.1812;
param workload[JOB] := <1> 21.8284, <2> 46.8506, <3> 8.7502, <4> 1.4414, <5> 37.3835, <6> 1.4635, <7> 17.9523, <8> 21.0006, <9> 30.5872, <10> 42.2015, <11> 44.6368, <12> 30.2117, <13> 27.7219, <14> 16.2722, <15> 23.4152, <16> 5.4436, <17> 32.5461, <18> 47.3737, <19> 8.3838, <20> 38.1812;
param capacity[MACHINE] := <1> 53.962, <2> 53.962, <3> 53.962, <4> 53.962, <5> 53.962, <6> 53.962, <7> 53.962;

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
