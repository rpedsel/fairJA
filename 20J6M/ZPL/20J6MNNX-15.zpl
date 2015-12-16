set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2331, <2> 18.2317, <3> 15.2148, <4> 24.3955, <5> 17.3575, <6> 32.203, <7> 25.5801, <8> 14.4995, <9> 23.7077, <10> 20.9649, <11> 27.2506, <12> 28.1031, <13> 28.6758, <14> 20.8301, <15> 30.8691, <16> 20.6535, <17> 23.3537, <18> 29.9756, <19> 31.5128, <20> 25.5643;
param workload[JOB] := <1> 4.7152, <2> 4.2699, <3> 3.9006, <4> 4.9392, <5> 4.1662, <6> 5.6748, <7> 5.0577, <8> 3.8078, <9> 4.8691, <10> 4.5787, <11> 5.2202, <12> 5.3012, <13> 5.355, <14> 4.564, <15> 5.556, <16> 4.5446, <17> 4.8326, <18> 5.475, <19> 5.6136, <20> 5.0561;
param capacity[MACHINE] := <1> 97.4975, <2> 97.4975, <3> 97.4975, <4> 97.4975, <5> 97.4975, <6> 97.4975;

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
