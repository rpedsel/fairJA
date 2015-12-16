set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.5881, <2> 27.9651, <3> 26.9407, <4> 25.9181, <5> 27.1503, <6> 23.6691, <7> 27.0815, <8> 20.7643, <9> 28.4919, <10> 30.4125, <11> 16.4371, <12> 19.8522, <13> 33.1361, <14> 17.3037, <15> 31.4202, <16> 27.5686, <17> 22.3169, <18> 19.8271, <19> 25.4066, <20> 32.2747;
param workload[JOB] := <1> 9.5881, <2> 27.9651, <3> 26.9407, <4> 25.9181, <5> 27.1503, <6> 23.6691, <7> 27.0815, <8> 20.7643, <9> 28.4919, <10> 30.4125, <11> 16.4371, <12> 19.8522, <13> 33.1361, <14> 17.3037, <15> 31.4202, <16> 27.5686, <17> 22.3169, <18> 19.8271, <19> 25.4066, <20> 32.2747;
param capacity[MACHINE] := <1> 82.2541, <2> 82.2541, <3> 82.2541, <4> 82.2541, <5> 82.2541, <6> 82.2541;

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
