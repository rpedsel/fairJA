set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6451, <2> 21.36, <3> 13.0686, <4> 22.4245, <5> 15.8061, <6> 27.4005, <7> 27.2306, <8> 28.0364, <9> 37.6151, <10> 26.2976, <11> 28.551, <12> 25.4402, <13> 28.0537, <14> 22.2902, <15> 27.0493, <16> 29.2357, <17> 28.4727, <18> 30.4943, <19> 27.615, <20> 32.28;
param workload[JOB] := <1> 21.2518, <2> 21.6504, <3> 31.2911, <4> 21.5102, <5> 12.4031, <6> 40.6606, <7> 21.4639, <8> 32.823, <9> 28.6709, <10> 32.8975, <11> 40.8083, <12> 8.6847, <13> 33.4112, <14> 44.8645, <15> 22.3892, <16> 13.1544, <17> 31.7174, <18> 31.7956, <19> 11.158, <20> 37.9312;
param capacity[MACHINE] := <1> 77.2196, <2> 77.2196, <3> 77.2196, <4> 77.2196, <5> 77.2196, <6> 77.2196, <7> 77.2196;

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
