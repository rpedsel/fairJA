set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.1544, <2> 33.4913, <3> 13.7048, <4> 25.8656, <5> 35.1702, <6> 37.4009, <7> 4.2608, <8> 29.573, <9> 3.8786, <10> 40.955, <11> 35.0542, <12> 30.6144, <13> 9.8038, <14> 48.0031, <15> 29.774, <16> 45.7278, <17> 15.0488, <18> 22.8547, <19> 15.0142, <20> 20.7535;
param workload[JOB] := <1> 5.6705, <2> 5.7872, <3> 3.702, <4> 5.0858, <5> 5.9304, <6> 6.1156, <7> 2.0642, <8> 5.4381, <9> 1.9694, <10> 6.3996, <11> 5.9207, <12> 5.533, <13> 3.1311, <14> 6.9284, <15> 5.4566, <16> 6.7622, <17> 3.8793, <18> 4.7807, <19> 3.8748, <20> 4.5556;
param capacity[MACHINE] := <1> 98.9852, <2> 98.9852, <3> 98.9852, <4> 98.9852, <5> 98.9852, <6> 98.9852, <7> 98.9852;

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
