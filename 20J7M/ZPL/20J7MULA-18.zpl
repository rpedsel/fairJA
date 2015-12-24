set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.3826, <2> 46.7321, <3> 39.2354, <4> 49.1766, <5> 46.4978, <6> 34.6643, <7> 12.6589, <8> 29.8166, <9> 23.0248, <10> 3.1164, <11> 25.0361, <12> 39.1947, <13> 20.2393, <14> 22.3074, <15> 35.3286, <16> 8.9099, <17> 48.175, <18> 42.8559, <19> 4.1603, <20> 46.6299;
param workload[JOB] := <1> 1048.6328, <2> 2183.8892, <3> 1539.4166, <4> 2418.338, <5> 2162.0454, <6> 1201.6137, <7> 160.2477, <8> 889.0296, <9> 530.1414, <10> 9.7119, <11> 626.8063, <12> 1536.2245, <13> 409.6293, <14> 497.6201, <15> 1248.11, <16> 79.3863, <17> 2320.8306, <18> 1836.6282, <19> 17.3081, <20> 2174.3476;
param capacity[MACHINE] := <1> 3269.9939, <2> 3269.9939, <3> 3269.9939, <4> 3269.9939, <5> 3269.9939, <6> 3269.9939, <7> 3269.9939;

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
